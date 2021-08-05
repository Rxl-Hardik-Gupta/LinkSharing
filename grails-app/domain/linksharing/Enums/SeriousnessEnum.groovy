package linksharing.Enums

enum SeriousnessEnum {

    CASUAL("casual"),
    SERIOUS("serious"),
    VERY_SERIOUS("verySerious"),

    private final String val



    SeriousnessEnum(String val){
        this.val = val
    }


    String value() {
        return this.val;
    }


}
