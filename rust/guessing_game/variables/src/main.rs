fn main() {
    let x = 5;
    let x = x + 1;

    {
        let x = x * 2;
        println!("in: x is {x}");
    }
    println!("out: x is {x}");

    let x: (i32, f64, u8) = (
        500, 6.4, 1
    );
    
    let a = x.0;
    println!("{a}")
}
