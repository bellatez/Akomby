import 'package:get/get.dart';

class AppTranslations extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en': Locales.en,
    'fr': Locales.fr,
  };
}

class LocalKeys{
  static const String tOnboardingTitle1= "tOnboardingTitle1";
  static const String tOnboardingTitle2 = "tOnboardingTitle2";
  static const String tOnboardingTitle3 = "tOnboardingTitle3";
  static const String tOnboardingSubTitle1 = "tOnboardingSubTitle1";

  static const String tOnboardingSubTitle2 = "tOnboardingSubTitle2";
  static const String tOnboardingSubTitle3 = "tOnboardingSubTitle3";
}


class Locales{
  static const en = {
    "tOnboardingTitle1": "Access Numerous Helps",
    "tOnboardingTitle2": "Hire a nanny in minutes",
    "tOnboardingTitle3": "Have a tidy home with our maids",
    "tOnboardingSubTitle1": "We have compiled nannies and maids in different quarters and placed in your palms",
    "tOnboardingSubTitle2": "Get a nanny to take care of your kids while you are away",
    "tOnboardingSubTitle3": "Need some help with house chores? we have someone for you"
  };

  static const fr = {
    "tOnboardingTitle1": "Accédez à de nombreuses aides",
    "tOnboardingTitle2": "Embauchez une nounou en quelques minutes",
    "tOnboardingTitle3": "Ayez une maison bien rangée avec nos femmes de ménage",
    "tOnboardingSubTitle1": "Nous avons compilé des nounous et des femmes de chambre dans différents quartiers et les avons placées dans vos paumes",
    "tOnboardingSubTitle2": "Demandez à une nounou de s'occuper de vos enfants pendant votre absence",
    "tOnboardingSubTitle3": "Besoin d'aide pour les tâches ménagères ? nous avons quelqu'un pour vous"
  };

}