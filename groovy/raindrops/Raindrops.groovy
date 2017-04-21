
class Raindrops {

    static Map<Integer, String> LABELS = [
            3: "Pling",
            5: "Plang",
            7: "Plong"
    ]

    static def convert(int number) {
        def numbers = [3,5,7]

        def out = numbers
                .findAll{ number%it == 0 }
                .collect { LABELS[it] }
                .join()

        if (out.isEmpty())
            out = number.toString()

        out
    }
}