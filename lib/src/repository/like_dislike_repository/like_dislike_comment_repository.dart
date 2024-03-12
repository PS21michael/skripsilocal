
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../models/like_dislike_comment_model.dart';

class LikeDislikeCommentRepository extends GetxController{

  var count = 0;

  static LikeDislikeCommentRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // 1. Insert Like Dislike
  insertLikeDislikeCommentData(LikeDislikeCommentModel likeDislikeCommentModel) async{
    await _db.collection("/LikeDislikeComment").add(likeDislikeCommentModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
    print('LikeDislikeComment ke ${count+=1}Berhasil dibuat');
  }

  // 2. Fetching single record Like Dislike with idUser && idComments
  Future<LikeDislikeCommentModel> getSingelLikeDislikeCommentDetails(String idPengguna, String idComment) async{
    final snapshot = await _db.collection("/LikeDislikeComment").where("IdPengguna", isEqualTo: idPengguna).where("IdComment", isEqualTo: idComment).get();
    final likeDislikeCommentData = snapshot.docs.map((e) => LikeDislikeCommentModel.fromSnapshot(e)).single;

    return likeDislikeCommentData;
  }

  // 3. Fetching All record Like Dislike with idComment
  Future<List<LikeDislikeCommentModel>> getAllLikeDislikeComment (String idComment) async{
    final snapshot = await _db.collection("/LikeDislikeComment").where("IdComment", isEqualTo: idComment).get();
    final allLikeDislikeCommentData = snapshot.docs.map((e) => LikeDislikeCommentModel.fromSnapshot(e)).toList();

    return allLikeDislikeCommentData;
  }

  // 4. Update flag LIKE to DISLIKE or DISLIKE to LIKE with idlikeDislikeComment
  Future<void> updateLikeDislikeRecord(String flag, String id) async{
    Map<String, dynamic> json = {'Flag' : flag};
    await _db.collection("/LikeDislikeComment").doc(id).update(json).catchError((error, stackTrie){
      print(error.toString());
    });
  }

  // 5. Delete all value in singel idLikeDislikeComment
  Future<void> deleteSingleLikeDislikeCommentRecord(String id) async{
    await _db.collection("/LikeDislikeComment").doc(id).delete();
  }


}