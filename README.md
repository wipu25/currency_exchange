# Store Front Currency Exchange
The Currency Exchange application enables users to adjust currency rates for buying and selling, calculate prices accordingly, and print receipts using a thermal printer. Additionally, it provides a feature to display the daily transaction history.
** landscape orientation only

## Development
The Currency Exchange application is built using the Flutter framework and follows the MVC (Model-View-Controller) design pattern. It utilizes Riverpod for dependency injection, ensuring efficient state management and scalability. The data is stored online using Firestore, providing secure and real-time database capabilities. Additionally, Firebase Crashlytics is implemented to log and monitor real-time user errors, enhancing the application's reliability and debugging process.

## Folder Structure
folder has been seperate into
1. costants - containing strings of application
2. models - model files and generated model files using freezed and json serialized
3. presentation - individual screen sub-folder where inside each subfolder contain controller/ widgets and screen
4. service - service file where use widely in app.

## Depedencies
1. freezed_Annotation (Generating class Object)
2. json_Annotation (Converting JSON to Object)
3. esc_pos (Connecting POS Printer)
4. riverpod
5. intl (Coding Guideline)
6. firebase
