import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/controller/profile_controller.dart';
import 'package:skripsilocal/models/user_model.dart';
import 'package:skripsilocal/pages/components/newsDetailHeader.dart';

class ShowUser extends StatefulWidget {
  const ShowUser({Key? key}) : super(key: key);

  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {
  final ProfileController controller = Get.put(ProfileController());
  late Future<List<UserModel>> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = controller.getAllUser();
  }

  Future<void> _refreshListUser() async {
    setState(() {
      _futureUser = controller.getAllUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return SafeArea(
      child: Scaffold(
        appBar: const DetailHeader(),
        body: RefreshIndicator(
          onRefresh: _refreshListUser,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  FutureBuilder<List<UserModel>>(
                    future: _futureUser,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Column(
                              children: [
                                for (var i = 0; i < snapshot.data!.length; i += 2)
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildUserCard(snapshot.data![i]),
                                        if (i + 1 < snapshot.data!.length)
                                          _buildUserCard(snapshot.data![i + 1]),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return const Center(child: Text("Something Went Wrong"));
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserCard (UserModel user) {
    return SizedBox(
      width: 180,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(user.profilePicture),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  user.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      user.fullName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.home_filled,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      user.province,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      user.email,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      user.email,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
