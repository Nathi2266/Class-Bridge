📚 ClassBridge

ClassBridge is a cross-platform educational mobile application built with Flutter. It’s designed to bridge the gap between teachers and learners in South Africa (and beyond) by providing a centralized platform for communication, assignments, class management, and learning materials.

The app has two main roles: Teachers (admin side) and Learners (client side). Each role has its own tailored dashboard and features, making the experience intuitive and role-specific.

🌟 Core Idea

ClassBridge aims to simplify the education system by digitizing classroom activities into a lightweight mobile application. Teachers can manage classes, assignments, and learners, while learners can access study materials, submit assignments, and track their progress — all within one app.

✨ Features
👩‍🏫 For Teachers

Registration & Login with school credentials.

Dashboard with quick access to all modules.

Assignments Management: Create, edit, delete, and review submissions.

Class Schedule: Post class times and upcoming lessons.

Student Management: Add/remove learners, manage class lists.

Notifications & Announcements: Communicate with students.

Grading & Feedback: Provide marks and comments on submissions.

Analytics: View learner progress and class performance (future expansion).

🧑‍🎓 For Learners

Registration & Login with class codes.

Dashboard: Central hub for assignments, materials, and profile.

Assignments: View, submit, and track assignment status.

Class Materials: Access resources uploaded by teachers.

Profile: View and edit personal details.

Progress Tracking: Monitor performance over time.

Class Enrollment: Join classes via a code shared by the teacher.

🛠️ Tech Stack

Framework: Flutter

Language: Dart

IDE: Cursor AI + Android Studio

Assets: Custom logo (lib/assets/ClassBridgeLogo.png)

App Icons: Configured via flutter_launcher_icons

📂 Folder Structure
lib/
│
├── assets/
│   └── ClassBridgeLogo.png
│
├── learners/
│   ├── assignments_screen.dart
│   ├── class_materials_screen.dart
│   ├── dashboard_screen.dart
│   ├── login_screen.dart
│   └── profile_screen.dart
│
├── teachers/
│   ├── assignments_screen.dart
│   ├── class_schedule_screen.dart
│   ├── dashboard_screen.dart
│   ├── login_screen.dart
│   ├── notifications_screen.dart
│   └── student_management_screen.dart
│
└── main.dart

🚀 How It Works
🔹 Entry Point

The app launches with a Role Selection Screen.

Users choose Teacher or Learner.

🔹 Teacher Journey

Teacher selects Teacher → Login with credentials.

Redirected to Teacher Dashboard.

Can create assignments, post schedules, manage students, and send notifications.

Optionally grade submissions and provide feedback.

🔹 Learner Journey

Learner selects Learner → Login with class code.

Redirected to Learner Dashboard.

Can view assignments, access class materials, and update their profile.

Submit work, track progress, and receive feedback/notifications.

🔒 Security & Considerations

Role-based navigation ensures learners cannot access teacher features.

Password recovery and onboarding flows are planned for future versions.

Data security and privacy will be prioritized as backend integration evolves.

🎨 Branding & Logo

Official logo: lib/assets/ClassBridgeLogo.png

This logo is used in:

Splash screen (startup).

App launcher icon.

Documentation and README branding.

🏗️ Future Improvements

Add chat/messaging between teachers and learners.

Enable quizzes/tests for learners.

Provide analytics dashboards for teachers.

Multi-language support for broader reach.

Cloud backend integration for data storage and syncing.
