import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class CampusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20.0),
            child: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    'Wing',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  icon: Icon(
                    Mdi.alphaA,
                    color: Color(0xFF4B39EF),
                    size: 35,
                  ),
                  iconMargin: EdgeInsets.all(0),
                ),
                Tab(
                  child: Text(
                    'Wing',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  icon: Icon(
                    Mdi.alphaB,
                    color: Color(0xFF4B39EF),
                    size: 35,
                  ),
                  iconMargin: EdgeInsets.all(0),
                ),
                Tab(
                  child: Text(
                    'Wing',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  icon: Icon(
                    Mdi.alphaC,
                    color: Color(0xFF4B39EF),
                    size: 35,
                  ),
                  iconMargin: EdgeInsets.all(0),
                ),
                Tab(
                  child: Text(
                    'Wing',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  icon: Icon(
                    Mdi.alphaD,
                    color: Color(0xFF4B39EF),
                    size: 35,
                  ),
                  iconMargin: EdgeInsets.all(0),
                ),
                Tab(
                    child: Text(
                      'Workshop',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    icon: Icon(
                      Icons.factory_outlined,
                      color: Color(0xFF4B39EF),
                    )),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            //A Wing
            ListView(
              children: [
                ListTile(
                  title: Text(
                    'Ground Floor',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.work_outline),
                        ),
                      ),
                    ),
                    title: Text(
                      'Associate Dean Office',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.medical_information),
                        ),
                      ),
                    ),
                    title: Text(
                      'P ceutical Chemical Lab-1 & 2',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.medical_services),
                        ),
                      ),
                    ),
                    title: Text(
                      'Pharmaceutics Lab-1,2 & 3',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.factory_rounded),
                        ),
                      ),
                    ),
                    title: Text(
                      'Pilot Plant',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.meeting_room),
                        ),
                      ),
                    ),
                    title: Text(
                      'Seminar Room',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.work),
                        ),
                      ),
                    ),
                    title: Text(
                      'Chief A/c & Admin - Office',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.work_outline_outlined),
                        ),
                      ),
                    ),
                    title: Text(
                      'Admission Department',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.atm_rounded),
                        ),
                      ),
                    ),
                    title: Text(
                      'ATM & Computer Care',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'First Floor',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.computer_rounded),
                        ),
                      ),
                    ),
                    title: Text(
                      'Computer Lab-1',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.medication),
                        ),
                      ),
                    ),
                    title: Text(
                      'P ceutical analysis lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.work_sharp),
                        ),
                      ),
                    ),
                    title: Text(
                      'Central Faculty Area',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.room),
                        ),
                      ),
                    ),
                    title: Text(
                      'Instrument Room(CIL)',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.medication_rounded),
                        ),
                      ),
                    ),
                    title: Text(
                      'Pceutical Chem Lab-III ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.lens),
                        ),
                      ),
                    ),
                    title: Text(
                      'Research Lab ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.medication),
                        ),
                      ),
                    ),
                    title: Text(
                      'Quality Assuarance Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.medication),
                        ),
                      ),
                    ),
                    title: Text(
                      'Pharmaceuticals Lab(PG)',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.computer),
                        ),
                      ),
                    ),
                    title: Text(
                      'IT Exchange',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.meeting_room),
                        ),
                      ),
                    ),
                    title: Text(
                      'Classroom 101,102,103 & 104',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Second Floor',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.medical_information),
                        ),
                      ),
                    ),
                    title: Text(
                      'Pharmacology Lab-I,II& III',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.medical_information),
                        ),
                      ),
                    ),
                    title: Text(
                      'Pceutical Biotechnology Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.medical_information),
                        ),
                      ),
                    ),
                    title: Text(
                      'Pharmacognosy Lab-I, II',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.computer),
                        ),
                      ),
                    ),
                    title: Text(
                      'Computer Lab-II',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.meeting_room),
                        ),
                      ),
                    ),
                    title: Text(
                      'Classroom 201 & 202',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),

            //B Wing
            ListView(
              children: [
                ListTile(
                  title: Text(
                    'Ground Floor',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.account),
                        ),
                      ),
                    ),
                    title: Text(
                      'Associate Dean - Engeneering',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.lifebuoy),
                        ),
                      ),
                    ),
                    title: Text(
                      'Sever Room',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.pencilRuler),
                        ),
                      ),
                    ),
                    title: Text(
                      'Drawing Hall',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.testTube),
                        ),
                      ),
                    ),
                    title: Text(
                      'Chemistry Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.testTube),
                        ),
                      ),
                    ),
                    title: Text(
                      'Electronics Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.lightbulbOn),
                        ),
                      ),
                    ),
                    title: Text(
                      'Physics Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.alphaF),
                        ),
                      ),
                    ),
                    title: Text(
                      'LR-1,2,3,4 & 5',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'First Floor',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.accountGroupOutline),
                        ),
                      ),
                    ),
                    title: Text(
                      'Faculty Area 1,2 & 3',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.officeBuilding),
                        ),
                      ),
                    ),
                    title: Text(
                      'Academic office',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.laptop),
                        ),
                      ),
                    ),
                    title: Text(
                      'Computer Centre-1 & 2',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.laptop),
                        ),
                      ),
                    ),
                    title: Text(
                      'Programming Lab - 1',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.hammerWrench),
                        ),
                      ),
                    ),
                    title: Text(
                      'Mechanics Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.database),
                        ),
                      ),
                    ),
                    title: Text(
                      'Database Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.googleClassroom),
                        ),
                      ),
                    ),
                    title: Text(
                      'LR-6,7,8 & 9',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Second Floor',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.bookshelf),
                        ),
                      ),
                    ),
                    title: Text(
                      'Central Library',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.accountGroupOutline),
                        ),
                      ),
                    ),
                    title: Text(
                      'Faculty Area 4,5 ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.lightbulbOn),
                        ),
                      ),
                    ),
                    title: Text(
                      'Electronics Design Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.phoneInTalk),
                        ),
                      ),
                    ),
                    title: Text(
                      'Communication Lab-II',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.chip),
                        ),
                      ),
                    ),
                    title: Text(
                      'Digital Design Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.laptop),
                        ),
                      ),
                    ),
                    title: Text(
                      'Software Engineering Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.laptop),
                        ),
                      ),
                    ),
                    title: Text(
                      'Signal Processing Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.laptop),
                        ),
                      ),
                    ),
                    title: Text(
                      'Programming Lab - II',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.cogOutline),
                        ),
                      ),
                    ),
                    title: Text(
                      'Control System Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B39EF),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.googleClassroom),
                        ),
                      ),
                    ),
                    title: Text(
                      'LR 10,11,12',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),

            //c Wing
            ListView(
              children: [
                ListTile(
                  title: Text(
                    'Ground Floor',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.account),
                        ),
                      ),
                    ),
                    title: Text(
                      'Directorate',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.bullhorn),
                        ),
                      ),
                    ),
                    title: Text(
                      'Conference Room',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.school),
                        ),
                      ),
                    ),
                    title: Text(
                      'Training and Placement',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.account),
                        ),
                      ),
                    ),
                    title: Text(
                      'Deputy Registrar-Office',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.accountGroup),
                        ),
                      ),
                    ),
                    title: Text(
                      'Auditorium',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.theater),
                        ),
                      ),
                    ),
                    title: Text(
                      'Theatre',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.leadPencil),
                        ),
                      ),
                    ),
                    title: Text(
                      'Examination Dept.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.chartAreaspline),
                        ),
                      ),
                    ),
                    title: Text(
                      'Assesment Dept.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.domain),
                        ),
                      ),
                    ),
                    title: Text(
                      'HR Dept.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'First Floor',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.accountGroupOutline),
                        ),
                      ),
                    ),
                    title: Text(
                      'Faculty Area 6 & 7',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.fileSwap),
                        ),
                      ),
                    ),
                    title: Text(
                      'Project Lab-1',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.phoneInTalk),
                        ),
                      ),
                    ),
                    title: Text(
                      'Communication Lab-1',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.googleClassroom),
                        ),
                      ),
                    ),
                    title: Text(
                      'LR-13,14,15 & 16',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Second Floor',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.googleClassroom),
                        ),
                      ),
                    ),
                    title: Text(
                      'Faculty Area 8 & 9',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.laptop),
                        ),
                      ),
                    ),
                    title: Text(
                      'System Software Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.accessPointNetwork),
                        ),
                      ),
                    ),
                    title: Text(
                      'Adv. Computer Network',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.desktopClassic),
                        ),
                      ),
                    ),
                    title: Text(
                      'Project Lab-2',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.transmissionTower),
                        ),
                      ),
                    ),
                    title: Text(
                      'EXTC Project Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.webpack),
                        ),
                      ),
                    ),
                    title: Text(
                      'Embedded System Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.chip),
                        ),
                      ),
                    ),
                    title: Text(
                      'PCB Design Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Icons.doorbell),
                        ),
                      ),
                    ),
                    title: Text(
                      'Seminar Hall 1,2 & 3',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.googleClassroom),
                        ),
                      ),
                    ),
                    title: Text(
                      'LR-17,18 & 19',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),

            //D Wing
            //D Wing
            ListView(
              children: [
                ListTile(
                  title: Text(
                    'Ground Floor',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.flask),
                        ),
                      ),
                    ),
                    title: Text(
                      'Fluid Mechanics Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.tools),
                        ),
                      ),
                    ),
                    title: Text(
                      'Fluid Machinery Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.piston),
                        ),
                      ),
                    ),
                    title: Text(
                      'I.C Engine / Thermal Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.thermostat),
                        ),
                      ),
                    ),
                    title: Text(
                      'Thermodynamics Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.leak),
                        ),
                      ),
                    ),
                    title: Text(
                      'PLC and Sensoric Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.robotIndustrial),
                        ),
                      ),
                    ),
                    title: Text(
                      'BOSCH Centre of: Excellence in Automation',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.progressCheck),
                        ),
                      ),
                    ),
                    title: Text(
                      'Testing of material Lab',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4B39EF),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Icon(Mdi.googleClassroom),
                        ),
                      ),
                    ),
                    title: Text(
                      'LR-20,21,22,23 and 24 ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            //Workshop
            ListView(children: [
              ListTile(
                title: Text(
                  'Ground Floor',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.wrenchOutline),
                      ),
                    ),
                  ),
                  title: Text(
                    'CNC Lab',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.wrench),
                      ),
                    ),
                  ),
                  title: Text(
                    'Workshop 1 & 2',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'First Floor',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.wiper),
                      ),
                    ),
                  ),
                  title: Text(
                    'Measurement & Metrology',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.slotMachineOutline),
                      ),
                    ),
                  ),
                  title: Text(
                    'Theory of Machine Lab',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.desktopClassic),
                      ),
                    ),
                  ),
                  title: Text(
                    'Computer Centre',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.accountGroupOutline),
                      ),
                    ),
                  ),
                  title: Text(
                    'Faculty Area 001 & 002',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.googleClassroom),
                      ),
                    ),
                  ),
                  title: Text(
                    'LR 001 & 002',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Second Floor',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.fileCad),
                      ),
                    ),
                  ),
                  title: Text(
                    'CAD Centre',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.radiator),
                      ),
                    ),
                  ),
                  title: Text(
                    'Heat Transfer Lab',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.accountGroupOutline),
                      ),
                    ),
                  ),
                  title: Text(
                    'Faculty Area 003',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF4B39EF),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(Mdi.googleClassroom),
                      ),
                    ),
                  ),
                  title: Text(
                    'LR 003 & 004',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
