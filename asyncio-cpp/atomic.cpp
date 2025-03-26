#include <iostream>
#include <atomic>
#include <thread>
#include <functional>
#include <vector>

void worker(std::atomic<int>& x){
	for(int i = 0; i < 100000000; i ++) x++;
}

int main(){
	std::atomic<int> x{0};
	std::vector<std::thread*> q;
	for(int i = 0; i < 5; i ++){
		q.push_back(new std::thread(
			worker, std::ref(x)
		));
	}

	for(auto* th: q){
		th->join();	
	}
	
	std::cout << x << std::endl;

	return 0;
}
