import 'package:flutter/material.dart';

class RecentSection extends StatelessWidget {
  const RecentSection({super.key});

  @override
  Widget build(BuildContext context) {
    // 예시 데이터
    final List<Map<String, dynamic>> books = List.generate(
      5,
      (i) => {
        'title': 'Curious George(Royal Monkey)',
        'genre': 'Adventure, Animal',
        'point': 16,
        'rating': 4.3,
        'progress': 0.65,
        'image': 'https://covers.openlibrary.org/b/id/8231856-L.jpg',
      },
    );

    return ListView.separated(
      padding: const EdgeInsets.only(top: 20, bottom: 16, right: 14, left: 14),
      itemCount: books.length,
      separatorBuilder:
          (_, __) => const Divider(height: 24, color: Colors.grey),
      itemBuilder: (context, index) {
        final book = books[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                book['image']!,
                width: MediaQuery.of(context).size.width * 0.18, // 화면 너비의 약 18%
                height:
                    MediaQuery.of(context).size.width *
                    0.18 *
                    (94 / 67.4), // 비율 유지
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            // 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('Genre : ${book['genre']}'),
                  Text('Point : ${book['point']} 🪙'),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.blue, size: 18),
                      Text('${book['rating']}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // 진행률
                  LinearProgressIndicator(
                    value: book['progress'] as double,
                    backgroundColor: Colors.grey[200],
                    color: Colors.amber[400],
                    minHeight: 6,
                  ),
                  Text('${((book['progress'] as double) * 100).toInt()}%'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
