import 'package:flutter/material.dart';

import 'util/job_card.dart';
import 'util/recent_job_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobsForYou = [
    // [campanyname, jobsTitle, logoImagePath, hourlyRate]
    ['Nike', 'Shoes Market', 'lib/icons/nike.png', 20],
    ['Google', 'Best browser on earth', 'lib/icons/google.png', 20],
    ['Apple', 'Phone Store', 'lib/icons/apple.png', 20],
  ];

  final List jobRecentCard = [
    // [campanyname, jobsTitle, logoImagePath, hourlyRate]
    ['Nike', 'Shoes Market', 'lib/icons/nike.png', 22],
    ['Google', 'Best Web Browser', 'lib/icons/google.png', 53],
    ['Apple', 'best Store', 'lib/icons/apple.png', 34],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 75),
          //app bar
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200],
              ),
              child: Icon(
                Icons.menu_rounded,
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //discover a new part
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Discover New Part',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 30,
                            child: Icon(
                              Icons.search,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search for a job..',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.room_preferences_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),

          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'For You',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            height: 170,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: jobsForYou.length,
                  itemBuilder: (context, index) {
                    return JobCard(
                      companyName: jobsForYou[index][0],
                      jobTitle: jobsForYou[index][1],
                      logoImagePath: jobsForYou[index][2],
                      hourlyRate: jobsForYou[index][3],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 50,
          ),

          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Recently Added',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
            return RecentJobsCards(
              companyName: jobRecentCard[index][0],
              jobTitle: jobRecentCard[index][1],
              logoImagePath: jobRecentCard[index][2],
              hourlyRate:jobRecentCard[index][3],
            );
          }))
        ],
      ),
    );
  }
}
