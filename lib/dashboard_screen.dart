import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [Sidebar(), Expanded(child: DashboardContent())]),
    );
  }
}

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'AgriTech',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF22C55E),
            ),
          ),
          const SizedBox(height: 40),
          _menuItem(Icons.dashboard, 'Dashboard', 0),
          _menuItem(Icons.grass, 'Crops', 1),
          _menuItem(Icons.cloud, 'Weather', 2),
          _menuItem(Icons.bar_chart, 'Analytics', 3),
          const Spacer(),
          Row(
            children: const [
              CircleAvatar(child: Text('JD')),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Farm Manager',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, int index) {
    final active = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Selected: $title'),
            duration: const Duration(milliseconds: 600),
          ),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFE8F8EE) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: active ? const Color(0xFF22C55E) : Colors.grey),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: active ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Farm Dashboard',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // KPI CARDS
          Row(
            children: const [
              Expanded(child: StatCard('Total Yield', '245 tons', '+12.5%')),
              SizedBox(width: 16),
              Expanded(child: StatCard('Active Fields', '12', '+2.3%')),
              SizedBox(width: 16),
              Expanded(child: StatCard('Water Usage', '1,740 L', '-5.2%')),
              SizedBox(width: 16),
              Expanded(child: StatCard('Resources', '8 items', '+8.1%')),
            ],
          ),

          const SizedBox(height: 24),

          // CHARTS ROW
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(flex: 2, child: ChartCard('Yield Trends')),
              SizedBox(width: 16),
              Expanded(child: ChartCard('Resource Usage')),
            ],
          ),

          const SizedBox(height: 24),

          // BOTTOM SECTION
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(flex: 2, child: CropHealthSection()),
              SizedBox(width: 16),
              Expanded(child: RightPanel()),
            ],
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;

  const StatCard(this.title, this.value, this.change, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(change, style: const TextStyle(color: Color(0xFF22C55E))),
        ],
      ),
    );
  }
}

class ChartCard extends StatelessWidget {
  final String title;
  const ChartCard(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.all(20),
      decoration: _card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          const Center(child: Text('Chart goes here')),
        ],
      ),
    );
  }
}

class CropHealthSection extends StatelessWidget {
  const CropHealthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Crop Health Monitor',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          CropHealthCard('Wheat', 'North Field A', 'Excellent', Colors.green),
          CropHealthCard('Corn', 'South Field B', 'Good', Colors.blue),
          CropHealthCard('Soybeans', 'East Field C', 'Warning', Colors.orange),
        ],
      ),
    );
  }
}

class CropHealthCard extends StatelessWidget {
  final String crop, field, status;
  final Color color;

  const CropHealthCard(
    this.crop,
    this.field,
    this.status,
    this.color, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(crop, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                field,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          Chip(label: Text(status), backgroundColor: color.withOpacity(.15)),
        ],
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: _card(),
          child: Column(
            children: const [
              Text(
                '24°C',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text('Partly Cloudy'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: _card(),
          child: const Text('Recent Activity'),
        ),
      ],
    );
  }
}

BoxDecoration _card() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)],
);
