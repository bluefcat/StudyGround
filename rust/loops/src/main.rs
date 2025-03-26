fn main() {
    let mut count = 0;
    'counting_up: loop {
        let mut remaining = 1;
        loop {
            println! ("remaining = {remaining}");
            if remaining == 0{
                break;
            }

            if count == 2 {
                break 'counting_up;
            }
            remaining -= 1;
        }
        count += 1;
    }

    let a = [10, 20, 30, 40, 50];
    for e in a {
        println!("{e}");
    }

    for n in (1..4).rev() {
        println!("{n}");
    }

}
