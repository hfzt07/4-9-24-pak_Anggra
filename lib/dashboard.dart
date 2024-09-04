import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GALLERY APPS'),
        backgroundColor: Colors.lightBlue.shade100, // Warna soft untuk AppBar
        centerTitle: true, // Membuat judul berada di tengah
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildHomeTab(), // Tab Home menampilkan daftar gambar dari Picsum
          _buildInfoTab(), // Tab Info
          _buildGalleryTab(), // Tab Gallery
          _buildAgendaTab(), // Tab Agenda
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue.shade200, // Warna soft senada untuk TabBar
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.info_outline), text: 'Info'),
            Tab(icon: Icon(Icons.picture_in_picture), text: 'Gallery'),
            Tab(icon: Icon(Icons.calendar_month), text: 'Agenda'),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade600,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }

  // Fungsi untuk membangun tampilan Tab Home
  Widget _buildHomeTab() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Ini adalah halaman Home. Di sini Anda dapat menampilkan informasi penting mengenai aplikasi atau lainnya.',
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Fungsi untuk membangun tampilan Tab Info
  Widget _buildInfoTab() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center, // Mengatur alignment menjadi center
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Informasi Juri Lomba',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          textAlign: TextAlign.center, // Mengatur teks menjadi center
        ),
      ),
      Expanded(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            _buildJudgeInfo(
              name: 'Andi Setiawan',
              title: 'Fotografer Profesional',
              description: 'Andi memiliki pengalaman lebih dari 15 tahun di dunia fotografi dan telah memenangkan berbagai penghargaan internasional.',
              imageUrl: 'https://picsum.photos/100/100?random=1',
            ),
            _buildJudgeInfo(
              name: 'Budi Santoso',
              title: 'Editor Majalah Fotografi',
              description: 'Budi adalah editor senior di salah satu majalah fotografi terkemuka di Indonesia dengan keahlian dalam penilaian estetika foto.',
              imageUrl: 'https://picsum.photos/100/100?random=2',
            ),
            _buildJudgeInfo(
              name: 'Citra Lestari',
              title: 'Kreator Konten Visual',
              description: 'Citra dikenal sebagai kreator konten visual dengan jutaan pengikut di media sosial dan ahli dalam tren fotografi modern.',
              imageUrl: 'https://picsum.photos/100/100?random=3',
            ),
            _buildJudgeInfo(
              name: 'Dewi Permata',
              title: 'Guru Fotografi',
              description: 'Dewi telah mengajar fotografi selama lebih dari 10 tahun dan memiliki latar belakang pendidikan seni visual.',
              imageUrl: 'https://picsum.photos/100/100?random=4',
            ),
            _buildJudgeInfo(
              name: 'Eko Nugroho',
              title: 'Fotografer Dokumenter',
              description: 'Eko fokus pada fotografi dokumenter dan telah mengerjakan berbagai proyek sosial di seluruh Indonesia.',
              imageUrl: 'https://picsum.photos/100/100?random=5',
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildJudgeInfo({required String name, required String title, required String description, required String imageUrl}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 5,
    margin: EdgeInsets.symmetric(vertical: 10.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
              imageUrl,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade800,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


  // Fungsi untuk membangun tampilan Tab Gallery
  Widget _buildGalleryTab() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Foto-Foto Terbaik',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Expanded(
        child: GridView.builder(
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Aksi saat gambar di-tap
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Image.network(
                        'https://picsum.photos/400/600?random=${index + 20}',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        'https://picsum.photos/200/300?random=${index + 20}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'FOTO ${index + 1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}



  // Fungsi untuk membangun tampilan Tab Agenda
  Widget _buildAgendaTab() {
  return ListView.builder(
    padding: EdgeInsets.all(16.0),
    itemCount: 11, // Tambah 1 item untuk judul "Lomba Fotografi"
    itemBuilder: (context, index) {
      // Data untuk setiap acara
      final events = [
        {'title': 'Lomba Fotografi Alam', 'date': '12 September 2024'},
        {'title': 'Lomba Fotografi Potret', 'date': '20 September 2024'},
        {'title': 'Lomba Fotografi Malam', 'date': '28 September 2024'},
        {'title': 'Lomba Fotografi Jalanan', 'date': '5 Oktober 2024'},
        {'title': 'Lomba Fotografi Arsitektur', 'date': '10 Oktober 2024'},
        {'title': 'Lomba Fotografi Makro', 'date': '15 Oktober 2024'},
        {'title': 'Lomba Fotografi Hitam Putih', 'date': '20 Oktober 2024'},
        {'title': 'Lomba Fotografi Smartphone', 'date': '25 Oktober 2024'},
        {'title': 'Lomba Fotografi Pemandangan', 'date': '30 Oktober 2024'},
        {'title': 'Lomba Fotografi Kreatif', 'date': '5 November 2024'},
      ];

      if (index == 0) {
        // Jika index 0, tampilkan judul "Lomba Fotografi"
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Center(
            child: Text(
              'Lomba Fotografi',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
        );
      } else {
        // Tampilkan item lomba fotografi
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Stack(
            children: [
              // Gambar latar belakang
              Positioned.fill(
                child: Opacity(
                  opacity: 0.3,
                  child: Image.network(
                    'https://picsum.photos/800/400?random=${index + 30}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.camera_alt, color: Colors.white),
                ),
                title: Text(
                  events[index - 1]['title']!, // Index dikurangi 1 untuk mengakomodasi judul
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade800,
                  ),
                ),
                subtitle: Text(
                  events[index - 1]['date']!,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
              ),
            ],
          ),
        );
      }
    },
  );
}

}
