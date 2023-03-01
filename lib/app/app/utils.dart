



String formatDate(String date) {
  var formattedDate = DateTime.parse(date);
  return "${formattedDate.day}/${formattedDate.month}/${formattedDate.year} at ${formattedDate.hour}:${formattedDate.minute}";
}