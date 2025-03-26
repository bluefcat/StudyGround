use std::io;

fn main() {
    let x: usize = 10;
    let y: (u32, f32, char) = (
        32, 3.14, 'A'
    );
    
    let (_a, _b, _c) = y;
    let z: u32 = y.0;

    let p: [i32; 5] =[1, 2, 3, 4, 5];
    let q: [i32; 5] = [3; 5];

    println!("{} {:?} {} {:?} {}", x, y, z, p, q[2]);

    let mut index = String::new();
    
    io::stdin()
        .read_line(&mut index)
        .expect("Failed to read line");

    let index: usize = index
        .trim()
        .parse()
        .expect("Index entered was not a number");

    let element = p[index];

    println!("{element}");

}
