import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:faker/faker.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Slidable',
          home: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Text('Flutter Slidable'),
              backgroundColor: Colors.black,
            ),
            body: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 1.h),
              itemCount: 30,
              itemBuilder: (context, index) {
                final number = index + 1;
                final faker = Faker();
                final name = faker.person.name();
                final address = faker.address.streetAddress();

                return SizedBox(
                  height: 10.h,
                  child: Slidable(
                    key: ValueKey(index),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      children: const [
                        SlidableAction(
                          onPressed: doNothing,
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: doNothing,
                          backgroundColor: Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ],
                    ),
                    endActionPane: const ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 2,
                          onPressed: doNothing,
                          backgroundColor: Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.archive,
                          label: 'Archive',
                        ),
                        SlidableAction(
                          onPressed: doNothing,
                          backgroundColor: Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Save',
                        ),
                      ],
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      color: const Color(0xC5393646),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Container(
                              width: 12.w,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: Center(
                                child: Text(
                                  '$number',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('nama: $name',
                                    style:
                                        const TextStyle(color: Colors.white)),
                                const SizedBox(height: 2),
                                Text(
                                  'alamat: $address',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

void doNothing(BuildContext context) {}
