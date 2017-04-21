import java.time.Instant

class Gigasecond {

    static def from(Date d) {
        Date.from(Instant.ofEpochMilli(d.getTime() + 1000000000000))
    }

}
