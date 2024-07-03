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
          // HEADER SECTION
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              child: ListView(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                children: [
                                  'Delete',
                                ]
                                    .map(
                                      (e) => InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16),
                                          child: Text(e),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ));
                  },
                  icon: Icon(Icons.more_vert),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          // IMAGE SECTION
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
                'https://images.unsplash.com/photo-1718964313551-420f92249238?q=80&w=984&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.cover),
          ),

          // LIKED COMMENT SECTION
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite),
                color: Colors.red,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment_outlined,
                    color: Colors.white,
                  )),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
                color: Colors.white,
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.bookmark_border),
                      color: Colors.white,
                      onPressed: () {},
                    )),
              )
            ],
          ),

          // DESCRIPTION AND NUMBER OF COMMENTS
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w800, color: Colors.white),
                  child: Text(
                    '1000 likes',
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'username',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                '  Hey this is sone description to be replaced',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'View all 200 Comments',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '26/06/2024',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



// import 'dart:math';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class PostCard extends StatefulWidget {
//   const PostCard({super.key});

//   @override
//   State<PostCard> createState() => _PostCardState();
// }

// class _PostCardState extends State<PostCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         children: [
//           //HEADER SECTION
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16)
//                 .copyWith(right: 0),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 16,
//                   backgroundImage: NetworkImage(
//                       'https://images.unsplash.com/photo-1630568119734-1f6df1cd1669?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 8),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'somya_09',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     showDialog(
//                         context: context,
//                         builder: (context) => Dialog(
//                               child: ListView(
//                                 padding: EdgeInsets.symmetric(vertical: 16),
//                                 shrinkWrap: true,
//                                 children: [
//                                   'Delete',
//                                 ]
//                                     .map(
//                                       (e) => InkWell(
//                                         onTap: () {},
//                                         child: Container(
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 12, horizontal: 16),
//                                           child: Text(e),
//                                         ),
//                                       ),
//                                     )
//                                     .toList(),
//                               ),
//                             ));
//                   },
//                   icon: Icon(Icons.more_vert),
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//           //IMAGE SECTION
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.35,
//             width: double.infinity,
//             child: Image.network(
//                 'https://images.unsplash.com/photo-1718964313551-420f92249238?q=80&w=984&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//                 fit: BoxFit.cover),
//           ),

//           //LIKED COMMENT SECTION
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(Icons.favorite),
//                 color: Colors.red,
//               ),
//               IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.comment_outlined,
//                     color: Colors.white,
//                   )),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(Icons.send),
//                 color: Colors.white,
//               ),
//               Expanded(
//                 child: Align(
//                     alignment: Alignment.bottomRight,
//                     child: IconButton(
//                       icon: Icon(Icons.bookmark_border),
//                       color: Colors.white,
//                       onPressed: () {},
//                     )),
//               )
//             ],
//           ),

//           //DESCRIPTION AND NUMBER OF COMMENTS
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 16,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 DefaultTextStyle(
//                   style: Theme.of(context).textTheme.copyWith(FontWeight:800),
//                   child: Text(
//                     '1000 likes',
//                     // style: ( color: const Color.fromARGB(255, 234, 10, 10)),
//                   ),
//                 ),
//                 // )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
