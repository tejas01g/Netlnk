import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1630568119734-1f6df1cd1669?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'somya_09',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                //     IconButton(
                //       onPressed: () {
                //         showDialog(context: context, builder: (context) => Dialog(
                //           child: ListView(
                //             padding: EdgeInsets.symmetric(
                //               vertical: 16
                //             ),
                //       //       shrinkWrap: true,
                //       //       children: [
                //       //         'Delete',
                //       //   //     ].map(e) =>
                //       //   //   ),

                //       //   // )),
                //       // },
                //       icon: Icon(Icons.more_vert),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
