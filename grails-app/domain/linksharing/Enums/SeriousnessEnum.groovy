package linksharing.Enums

enum SeriousnessEnum {

    CASUAL(0),
    SERIOUS(1),
    VERY_SERIOUS(2),

    private final int val



    SeriousnessEnum(int val){
        this.val = val
    }


    int value() {
        return this.val;
    }


}
