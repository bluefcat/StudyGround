#include <iostream>
#include <thread>
#include <future>

template<typename T>
T get_future(T x){
	return x;
}

int main(){
	std::packaged_task<int(int)> p(get_future<int>);
	std::future<int> f{p.get_future()};

	std::thread th(
		std::move(p),
		3
	);

	std::cout << f.get() << std::endl;
	th.join();
	return 0;
}
