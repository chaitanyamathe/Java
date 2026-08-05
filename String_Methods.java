class String_Methods{
    public static void main(String[] args) {
        String text = "Hello, Java World!";

        // 1. length()
        System.out.println("Length: " + text.length());

        // 2. toUpperCase()
        System.out.println("Uppercase: " + text.toUpperCase());

        // 3. substring()
        System.out.println("Substring (7 to 11): " + text.substring(7, 11));

        // 4. contains()
        System.out.println("Contains 'Java'? " + text.contains("Java"));    //returns only true or false
 
        // 5. replace()
        System.out.println("Replace 'Java' with 'Python': " + text.replace("Java", "Python"));
    }
}
//