import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> jobList = [
    "Carpentry Framework",
    "Carpentry Opportunities",
    "Software Development",
    "Marketing Specialist",
    "Sales Representative",
    "Graphic Designer",
    "Data Analyst",
    "Project Manager",
    "Customer Support",
    "Product Manager",
  ];

  List<String> filteredJobList = [];
  var result=0;

  @override
  void initState() {
    super.initState();
    filteredJobList = jobList;
  }

  void _filterJobs(String query) {
    final filteredJobs = jobList
        .where((job) => job.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredJobList = filteredJobs;
      result=filteredJobs.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue
              ),
              child: const Center(child: Text('Search job for database',style: TextStyle(color: Colors.white),)),
            ),

            TextField(
              onChanged: _filterJobs,
              decoration: const InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Text("Results: $result"),
            Expanded(
              child: ListView.builder(
                itemCount: filteredJobList.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(filteredJobList[index]),
                        ),
                        const Divider(), // This adds a line below the ListTile
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}