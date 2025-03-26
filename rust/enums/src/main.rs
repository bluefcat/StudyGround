#[derive(Debug)]
enum IPaddr {
    NONE,
    V4(u8, u8, u8, u8),
    V6(String),
}

#[derive(Debug)]
enum Option<T> {
    OFF,
    ON(T),
}

enum Number {
    One, Two, Three(IPaddr)
}

fn to_number(n: Number) -> u32{
    match n{
        Number::One => {
            println!("Number ONE!");
            1
        },
        Number::Two => 2,
        Number::Three(ip) => {
            println!("Number IP {:?}", ip);
            3
        }
    }
}

fn main() {
    let none = IPaddr::NONE;
    let four = IPaddr::V4(127, 0, 0, 1);
    let six = IPaddr::V6(String::from("::1"));
    println!("{:?} {:?} {:?}", none, four, six); 

    let off: Option<u32> = Option::OFF;
    let on = Option::<u32>::ON(32);
    println!("{:?} {:?}", off, on);
    
    println!("{}", to_number(Number::One));
    to_number(Number::Three(four));

    if let Option::ON(num) = on {
        println!("Hello {num}");
    }

    println!("Hello, world!");
}
