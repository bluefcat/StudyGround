fn add(x: u32) -> u32{
    x+1
}

fn main() {
    let y = {
        let x = 3;
        x + 1
    };

    let z = add(y);

    println!("{y}+1= {z}");
}
