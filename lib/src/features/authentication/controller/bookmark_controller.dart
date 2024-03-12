
import 'package:get/get.dart';
import 'package:skripsilocal/src/features/authentication/models/bookmark_model.dart';
import 'package:skripsilocal/src/repository/bookmark_repository/bookmark_repository.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class BookmarkController extends GetxController{

  static BookmarkController get instance => Get.find();

  Rx<BookmarkModel> bookmark = BookmarkModel.empty().obs;

  final _authRepo = Get.put(AuthenticationRepository());
  final _bookmarkRepo = Get.put(BookmarkRepository());

  Future<List<BookmarkModel>> getAllBookmark() async{
    return await _bookmarkRepo.getAllBookmarks();
  }

  Future<List<BookmarkModel>> getAllBookmarkfromSingleUser(String userId) async{
    return await _bookmarkRepo.getAllBookmarksFromSingleUser(userId);
  }


  Future<void> createBookMark(BookmarkModel bookmarkModel)async{
    print('Bookmark Akan Dibuat');
    await _bookmarkRepo.insertBookmark(bookmarkModel);
  }


}