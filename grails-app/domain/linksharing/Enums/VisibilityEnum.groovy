package linksharing.Enums

enum VisibilityEnum {
    PRIVATE("private"),

    PUBLIC("public"),

    private final String val



     VisibilityEnum(String val){
        this.val = val
    }


    String value() {
        return this.val;
    }
}
