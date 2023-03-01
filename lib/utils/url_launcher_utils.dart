import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

Future<void> viewGitHubProfile() async {
  final url = Uri.parse('https://github.com/vpsines');
  await launchInBrowser(url);
}

Future<void> viewLinkedInProfile() async {
  final url = Uri.parse('https://www.linkedin.com/in/vyshnav-sasidharan/');
  await launchInBrowser(url);
}

Future<void> viewInstagram() async {
  final url = Uri.parse('https://www.instagram.com/vp_sines/');
  await launchInBrowser(url);
}

Future<void> viewLeetcode() async {
  final url = Uri.parse('https://leetcode.com/sasip6028/');
  await launchInBrowser(url);
}

Future<void> viewFreeCodeCamp() async {
  final url = Uri.parse('https://www.freecodecamp.org/vyshnav-sasidharan');
  await launchInBrowser(url);
}
