import 'package:get/get.dart';
import 'package:skripsilocal/models/bookmark_model.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';

class BookmarkController extends GetxController{

  static BookmarkController get instance => Get.find();

  // final _authRepo = Get.put(AuthenticationRepository());
  final _bookmarkRepo = Get.put(BookmarkRepository());

  Future<List<BookmarkModel>> getAllBookmarkfromSingleUser(String userId) async{
    return await _bookmarkRepo.getAllBookmarksFromSingleUser(userId);
  }


  Future<void> createBookMark(BookmarkModel bookmarkModel)async{
    await _bookmarkRepo.insertBookmark(bookmarkModel);
  }

  Future<void> deleteBookmark(String id)async{
    await _bookmarkRepo.deleteBookMark(id);
  }

  Future<List<BookmarkModel>> getAllBookmarkOne(String idPengguna, String title) async{
    return await _bookmarkRepo.getAllBookmarksOne(idPengguna, title);
  }

}