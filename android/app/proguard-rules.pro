# Stripe Android SDK rules
-keep class com.stripe.android.** { *; }
-dontwarn com.stripe.android.**

# Keep generic types for payment methods
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName *;
}
