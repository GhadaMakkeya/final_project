class AppStrings {
  static const String appName = "VELOURA";
  // onboarding screen
  static const String firstOnboardeingScreenTitle = 'Timeless\nCraft';
  static const String secondOnboardingScreenTitle = 'Pure\nElegance';
  static const String thirdOnboardingScreenTitle = 'Signature\nLeather';
  static const String firstOnboardingScreenSubtitle =
      'Discover pieces made with generations of expertise and enduring quality.';
  static const String secondOnboardingScreenSubtitle =
      'Every stitch, every detail — curated for those who demand perfection.';
  static const String thirdOnboardingScreenSubtitle =
      'Elevate your daily ensemble with our collection of artisan-crafted leather goods.';

  // Profile
  static const name = "Jane Doe";
  static const email = "jane.doe@example.com";

  // Sections
  static const account = "ACCOUNT";
  static const preferences = "PREFERENCES";
  static const information = "INFORMATION";

  // Actions
  static const changePassword = "Change Password";
  static const logout = "Logout";

  // Theme
  static const theme = "Theme";
  static const light = "Light";
  static const dark = "Dark";

  // Info
  static const privacyPolicy = "Privacy Policy";
  static const aboutUs = "About Us";
  static const contactUs = "Contact Us";

  // App

  // Dialogs
  static const logoutTitle = "Logout";
  static const logoutMessage = "Are you sure you want to logout?";
  static const cancel = "Cancel";
  static const String collection = "COLLECTION";
  static const String jewelry = "Jewelry";
  static const String filter = "FILTER";
  static const String sort = "SORT";

  static String itemsCount(int count) => "$count Items";




  static const String emailRequired = "Email is required";
  static const String emailMinLength =
      "The part before @ must be at least 6 characters long";
  static const String emailMustEndGmail = "Email must end with @gmail.com";
  static const String emailInvalidFormat = "Invalid email format";
  static const String idRequired = "ID is required.";
  static const String idInvalid =
      "ID must be exactly 14 digits long and contain only numbers.";
  static const String phoneRequired = "Phone number is required.";
  static const String phoneInvalidStart =
      "Phone number must start with '01' followed by 0, 1, 2, or 5.";
  static const String phoneInvalidLength =
      "Phone number must be exactly 11 digits long.";
  static const String phoneInvalidFormat =
      "Phone number can only contain numbers.";
  static const String usernameRequired = "Username is required.";
  static const String usernameMinLength =
      "Username must be at least 3 characters long.";
  static const String usernameMustStartWithLetter =
      "Username must start with a letter.";
  static const String usernameMustContainAtLeast3Letters =
      "Username must contain at least 3 letters.";
  static const String usernameInvalidFormat =
      "Username can only contain letters and numbers.";
  static const String passwordAtLeast8Char =
      'Password must be at least 8 characters long.';
  static const String passwordAtLeast1Uppercase =
      'Password must contain at least one uppercase letter.';
  static const String passwordAtLeast1Lowercase =
      'Password must contain at least one lowercase letter.';
  static const String passwordAtLeast1Number =
      'Password must contain at least one number.';
  static const String passwordAtLeast1SpecialChar =
      'Password must contain at least one special character.';
  static const String passwordNotTheSame =
      "Password and confirm password must be the same.";
  static const String emailError = 'Please enter a valid email address';
  static const String fieldRequired = 'Password is required.';
  static const String nameError =
      'Please enter a valid name (letters and spaces only)';

}
