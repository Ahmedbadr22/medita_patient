import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FirstAidModel {
  final String name;
  final String subtitle;
  final String description;
  final Color color;
  final String videoUrl;
  final String? imageUrl;
  VideoPlayerController? controller;

  FirstAidModel({
    required this.name,
    required this.subtitle,
    required this.videoUrl,
    required this.imageUrl,
    required this.color,
    required this.description,
  });
}
