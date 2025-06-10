import 'package:flutter/material.dart';
import 'lead_tile_card.dart';

class PendingLeads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LeadTileCard(
          title: "Rajesh",
          subtitle: "LEAD/202526/00008232",
          icon: Icons.person,
          color: Colors.teal,
          type: "Existing Customer",
          product: "Kisan Credit Card",
          phone: "7200517188",
          createdon: "03-03-2025",
          location: "Chennai",
          loanamount: "750000",
        ),
        LeadTileCard(
          title: "Vishal",
          subtitle: "LEAD/202526/00008236",
          icon: Icons.person,
          color: Colors.teal,
          type: "New Customer",
          product: "Jewel Loan",
          phone: "7200517188",
          createdon: "03-05-2025",
          location: "Chennai",
          loanamount: "840000",
        ),
        LeadTileCard(
          title: "Gaurav",
          subtitle: "LEAD/202526/00008314",
          icon: Icons.person,
          color: Colors.teal,
          type: "New Customer",
          product: "Minor Irrigation",
          phone: "7200517188",
          createdon: "25-03-2025",
          location: "Chennai",
          loanamount: "100000",
        ),
        LeadTileCard(
          title: "Shyam",
          subtitle: "LEAD/202526/00008220",
          icon: Icons.person,
          color: Colors.teal,
          type: "New Customer",
          product: "Joint Lending Group",
          phone: "7200517188",
          createdon: "25-05-2025",
          location: "Chennai",
          loanamount: "125000",
        ),
      ],
    );
  }
}
