import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double totalsales(List<double>? totalammount) {
  // here i am passinf list of total ammount some is null so in return i wan t sum of all
  if (totalammount == null) return 0.0; // Return 0 if the list is null
  return totalammount
      .where((amount) => amount != null)
      .fold(0.0, (sum, amount) => sum + amount);
}

double avargeRating(List<double>? ratings) {
  final list = (ratings ?? []).where((e) => e.isFinite).toList();
  if (list.isEmpty) return 0.0;

  final avg = list.fold(0.0, (s, e) => s + e) / list.length;
  return double.parse(avg.toStringAsFixed(2));
}

double totalRevenueForValidFarms(
  List<OrderRecord>? orders,
  List<FarmsRecord>? farms,
  List<UsersRecord>? users,
) {
  if (orders == null || farms == null || users == null) {
    return 0.0;
  }

  final existingUserPaths = users.map((user) => user.reference.path).toSet();
  final validFarmPaths = farms
      .where(
        (farm) =>
            farm.userRef != null &&
            existingUserPaths.contains(farm.userRef!.path),
      )
      .map((farm) => farm.reference.path)
      .toSet();

  return orders.where((order) {
    final farmRef = order.farmRef;
    return order.orderStatus != 'Rejected' &&
        farmRef != null &&
        validFarmPaths.contains(farmRef.path);
  }).fold(0.0, (sum, order) => sum + order.totalAmmount);
}

String monthlyGrowth(
  List<UsersRecord>? users,
  List<OrderRecord>? orders,
  List<FarmsRecord>? farms,
  String metric,
) {
//function
  final userList = users ?? [];
  List<DateTime> dates = [];
  List<double> values = [];

  if (metric == 'producer' || metric == 'consumer') {
    final filteredUsers = userList
        .where(
          (user) => user.role == metric && user.createdTime != null,
        )
        .toList();

    dates = filteredUsers.map((user) => user.createdTime!).toList();
    values = filteredUsers.map((user) => 1.0).toList();
  } else if (metric == 'revenue') {
    final existingUserPaths =
        userList.map((user) => user.reference.path).toSet();
    final validFarmPaths = (farms ?? [])
        .where(
          (farm) =>
              farm.userRef != null &&
              existingUserPaths.contains(farm.userRef!.path),
        )
        .map((farm) => farm.reference.path)
        .toSet();

    final validOrders = (orders ?? []).where((order) {
      final farmRef = order.farmRef;
      return order.orderStatus != 'Rejected' &&
          order.createdAt != null &&
          farmRef != null &&
          validFarmPaths.contains(farmRef.path);
    }).toList();

    dates = validOrders.map((order) => order.createdAt!).toList();
    values = validOrders.map((order) => order.totalAmmount).toList();
  } else {
    return '0% this month';
  }

  if (dates.isEmpty || values.isEmpty) {
    return '0% this month';
  }

  final now = DateTime.now();
  final currentMonthStart = DateTime(now.year, now.month);
  final nextMonthStart = DateTime(now.year, now.month + 1);
  final previousMonthStart = DateTime(now.year, now.month - 1);
  var currentMonthValue = 0.0;
  var previousMonthValue = 0.0;

  for (var index = 0; index < dates.length && index < values.length; index++) {
    final date = dates[index];
    final value = values[index];

    if (!value.isFinite) {
      continue;
    }

    if (!date.isBefore(currentMonthStart) && date.isBefore(nextMonthStart)) {
      currentMonthValue += value;
    } else if (!date.isBefore(previousMonthStart) &&
        date.isBefore(currentMonthStart)) {
      previousMonthValue += value;
    }
  }

  final percentage = previousMonthValue == 0
      ? (currentMonthValue > 0 ? 100.0 : 0.0)
      : ((currentMonthValue - previousMonthValue) / previousMonthValue) * 100;
  final roundedPercentage = percentage.round();
  final sign = roundedPercentage > 0 ? '+' : '';

  return '$sign$roundedPercentage% this month';
}

bool hasPermission(
  String subRole,
  String section,
  String action,
) {
  final normalizedRole = subRole.trim().toLowerCase();
  final normalizedSection = section.trim().toLowerCase();
  final normalizedAction = action.trim().toLowerCase();

  // Super admins can perform every action shown in the permission dialog.
  if (normalizedRole == 'superadmin') {
    return true;
  }

  if (normalizedAction == 'view') {
    if (normalizedSection == 'orders') {
      return normalizedRole != 'read-only';
    }
    if (normalizedSection == 'support') {
      return normalizedRole == 'support';
    }
    if (normalizedSection == 'admin') {
      return false;
    }
    if (normalizedSection == 'finance') {
      return false;
    }
    return true;
  }

  if (normalizedSection == 'kyc' ||
      normalizedSection == 'reviews' ||
      normalizedSection == 'stores') {
    return normalizedRole == 'moderation';
  }

  if (normalizedSection == 'support' && normalizedAction == 'respond') {
    return normalizedRole == 'support';
  }

  if (normalizedSection == 'users' && normalizedAction == 'ban') {
    return normalizedRole != 'read-only';
  }

  return false;
}

int adminNewHelpMessageTotalCount(
  List<ConversationRecord>? conversations,
  List<HelpChatRecord>? helpChats,
) {
  if (conversations == null || conversations.isEmpty) {
    return 0;
  }

  if (helpChats == null || helpChats.isEmpty) {
    return 0;
  }

  final helpChatMap = {
    for (final chat in helpChats) chat.reference.path: chat,
  };

  int count = 0;

  for (final msg in conversations) {
    final helpChat = helpChatMap[msg.parentReference.path];

    if (helpChat == null) {
      continue;
    }

    // Count only user messages, not admin messages.
    if (msg.sender?.path != helpChat.userRef?.path) {
      continue;
    }

    final messageTime = msg.messageTime;
    if (messageTime == null) {
      continue;
    }

    final adminTime = helpChat.adminTime;

    // If admin never opened chat, all user messages are new.
    if (adminTime == null || messageTime.isAfter(adminTime)) {
      count++;
    }
  }

  return count;
}

bool checkOrderSearchMatch(
  String? searchQuery,
  String? buyerName,
  String? farmName,
  String? orderId,
) {
  if (searchQuery == null || searchQuery.isEmpty) {
    return true;
  }

  final query = searchQuery.toLowerCase();

  final buyerMatch =
      buyerName != null && buyerName.toLowerCase().contains(query);
  final farmMatch = farmName != null && farmName.toLowerCase().contains(query);
  final orderMatch = orderId != null && orderId.toLowerCase().contains(query);

  return buyerMatch || farmMatch || orderMatch;
}
