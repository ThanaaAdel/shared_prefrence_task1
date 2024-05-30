class ApiConstant {
 static const String apiBaseUrl = "https://doctoria.thetailorsweb.com/api/";
 static const String login = "auth/login";
 static const String signUp = "auth/signup";
 static const String logout = "auth/logout";
 static const String homeSlider ="settings/sliders";
 static const String doctor ="settings/doctors_by_category";
 static const String specializationPopularDoctors = "settings/specialization_popular_doctors";
 static const String bookingPatient = "/doctor/auth/bookings";
 static const String bookingAccept = "/doctor/auth/accept_booking";
 static const String bookingAcceptDetails = "doctor/auth/booking_details";
}

class ApiErrors {
 static const String badRequestError = 'badRequestError';
 static const String noContent = 'noContent';
 static const String forbiddenError = 'forbiddenError';
 static const String unauthorizedError = 'unauthorizedError';
 static const String notFoundError = 'notFoundError';
 static const String conflictError = 'conflictError';
 static const String internalServerError = 'internalServerError';
 static const String unknownError = 'unknownError';
 static const String timeoutError = 'timeoutError';
 static const String defaultError = 'defaultError';
 static const String cacheError = 'cacheError';
 static const String noInternetError = 'noInternetError';
 static const String loadingMessage = 'loadingMessage';
 static const String retryAgainMessage = 'retryAgainMessage';
 static const String ok = 'ok';
}