import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? coverPicture;
  XFile? profilePicture;

  ImageProvider<Object> coverPic() {
    if (coverPicture == null) {
      return const NetworkImage(
        "https://scontent.fdac136-1.fna.fbcdn.net/v/t39.30808-6/295682003_582279973295891_3884008506104133137_n.jpg?stp=dst-jpg_p640x640&_nc_cat=106&ccb=1-7&_nc_sid=e3f864&_nc_ohc=WZST0z0txo8AX9KsCJs&_nc_oc=AQlU2NxsbIuAwlT5w1lMomOZ04mCbnxbll_SDYukqWybTHLEEuVrThnzyckAU1oKqCo&_nc_ht=scontent.fdac136-1.fna&oh=00_AfDPpAA_eOzkUcpONp5ix5gfiD_fSjbM5UmMB4nd9QT79Q&oe=6387AA77"
      );
    } else {
      return FileImage(File(coverPicture!.path));
    }
  }

  ImageProvider<Object> profilePic() {
    if (profilePicture == null) {
      return const NetworkImage(
        "https://scontent.fdac136-1.fna.fbcdn.net/v/t39.30808-6/315616140_659589032231651_6311070719052057925_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=ZBALOjHd-dcAX8Y9QGY&tn=byuCwF-DrIyabaoC&_nc_ht=scontent.fdac136-1.fna&oh=00_AfBwis-WiqwgUXBEgZSyxCk1hUpzdoSRRX5EGoQmszauQA&oe=638870D0"
      );
     } else {
      return FileImage(File(profilePicture!.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.white,
      //   shadowColor: Colors.transparent,
      //   title: const Text(
      //     "Eti Eti Moni",
      //     style: TextStyle(color: Colors.black, fontSize: 15),
      //   ),
      //   leading: const Icon(Icons.arrow_back),
      //   actions: const [
      //     Icon(Icons.search),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Text("data"),
            Stack(
              children: [
                // Cover picture
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: coverPic(), fit: BoxFit.cover),
                  ),
                ),

                // profile picture
                Padding(
                  padding: const EdgeInsets.only(top: 47, left: 10),
                  child: CircleAvatar(
                      radius: 40,
                      //  backgroundColor: Colors.pinkAccent,
                      backgroundImage: profilePic()),
                ),

                // cover camera icon
                Padding(
                  padding: const EdgeInsets.only(top: 55, left: 260),
                  child: InkWell(
                    onTap: () async {
                      coverPicture =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                        )),
                  ),
                ),

                // profile camera icon
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 65),
                  child: InkWell(
                    onTap: () async {
                      profilePicture =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: const CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 15,
                          color: Colors.black,
                        )),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "MD MAMUN ISLAM",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Text(
                    "I miss you Minhaz",
                    style: TextStyle(fontSize: 15),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  // Story  profile  more
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Add to story
                      Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 3, right: 3, top: 5, bottom: 5),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.add_circle,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Add to Story",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //Edit profile
                      Card(
                        color: Colors.grey[400],
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 3, right: 5, top: 5, bottom: 5),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.edit,
                                size: 15,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Edit Profile",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.grey[400],
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                            size: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // profile locked
                  Row(
                    children: [
                      const Icon(Icons.security_sharp),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "You Locked Your Profile",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Learn More",
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 7,
                  ),

                  // Studying student
                  Row(
                    children: const [
                      Icon(
                        Icons.home_repair_service_sharp,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Studying at Student",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),

                  // Live in
                  Row(
                    children: const [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Live in Dinajpur",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.folder_special_rounded,
                        size: 30,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Followed by 111 People",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),

                  // About
                  Row(
                    children: const [
                      Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "See your About info",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      color: Colors.blue[200],
                      width: double.infinity,
                      child: const Center(
                          child: Text(
                        "Edit public details",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  const Divider(height: 5,),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Friends",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),),
                          Text("  570"),
                        ],
                      ),
                      const Text("Find Friends",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
                    itemCount: 10,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_,index){
                        return Column(
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green,
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage("https://scontent.fdac136-1.fna.fbcdn.net/v/t39.30808-1/316100741_121126650790671_3139941167082089323_n.jpg?stp=c0.6.200.200a_dst-jpg_p200x200&_nc_cat=105&ccb=1-7&_nc_sid=7206a8&_nc_ohc=wRJi99Sn5ksAX8Yjpu2&_nc_ht=scontent.fdac136-1.fna&oh=00_AfCwQrA1BCkxelw7F1WYdth1zqXLkAr5m4zcQBq-euPckA&oe=63892FBE"),)
                              ),
                            ),
                            const Text("Mamun"),
                          ],
                        );
                      }
                  ),
                  const SizedBox(height: 10,),

                  // See all friends
                  Container(
                    padding: const EdgeInsets.only(top: 7,bottom: 7),
                    width: double.infinity,
                    color: Colors.grey,
                    child: const Center(child: Text("See all Friends",style: TextStyle(fontWeight: FontWeight.bold),)),
                  ),
                  const Divider(height: 10,color: Colors.grey,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Posts",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      Row(
                        children: const [
                          Card(
                            color: Colors.grey,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                              child: Icon(Icons.palette_outlined),
                            ),
                          ),
                          Card(
                            color: Colors.grey,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                              child: Icon(Icons.settings_rounded),
                            ),
                          ),
                        ],
                      )
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
