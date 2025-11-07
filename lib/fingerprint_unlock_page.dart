import 'package:flutter/material.dart';

class FingerprintUnlockPage extends StatelessWidget {
  const FingerprintUnlockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fingerprint Unlock'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE8F0FF),
              Color(0xFFF7FBFF),
            ],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width > 420 ? 420 : size.width * 0.92,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 8,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 34),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Animated fingerprint ring
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeOutQuart,
                      builder: (context, value, child) {
                        final scale = 0.9 + 0.1 * value;
                        final opacity = 0.6 + 0.4 * value;
                        return Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: opacity,
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.18),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.fingerprint,
                          size: 92,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    Text(
                      'Place your finger on the sensor',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Touch the fingerprint pad to unlock the device securely.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),

                    const SizedBox(height: 26),

                    // Action buttons row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 6,
                          ),
                          onPressed: () {
                            // Show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Fingerprint recognized! Lock Unlocked.'),
                                duration: Duration(seconds: 2),
                              ),
                            );

                            // After 2 seconds, go back to LockControlPage
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pop(context);
                            });
                          },
                          child: const Text('Simulate Fingerprint Scan'),
                        ),

                        const SizedBox(width: 12),

                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'If the sensor fails, use the keypad to unlock.'),
                              ),
                            );
                          },
                          child: const Text('Help'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
