//Name: Alexander Petrov
//PSU account: aop5448

#include <iostream>
#include <climits>

int stocks_exhaustive(int prices[], int numPrices);
int stocks_greedy(int prices[], int numPrices);

struct pricePair {
  int index;
  int price;
};

int main(void){
  int prices[] = {7,1,5,3,6,4};
  // int prices[] = {7,6,4,3,1};
  int numPrices = sizeof(prices) / sizeof(prices[0]);

  std::cout << "Exhaustive search result: \n" <<
               stocks_exhaustive(prices, numPrices) << "\n";

  std::cout << "Greedy result: \n" <<
               stocks_greedy(prices, numPrices) << "\n";

  return 0;
}

/**
 * Exhastively searches for the best price to sell with a simple nested for loop
 * Time complexity:
 *    n+(n-1)+(n-2)+...+2+1 = (n(n+1)/2) ~= n^2/2
 *      = O(n^2)
 * @param prices Array of prices for each day
 * @return profit
 */
int stocks_exhaustive(int prices[], int numPrices){
  int bestProfit = 0;

  for(int i=0; i < numPrices; i++){
    for(int j=i+1; j < numPrices; j++){
      if(prices[j] - prices[i] > bestProfit){
        bestProfit = prices[j] - prices[i];
      }
    }
  }

  return bestProfit;
}

/**
 * Finds the best profit by walking through all prices and picking the lowest and highest available
 * Time complexity:
 *    = O(n)
 * @param prices Array of prices for each day
 * @return profit
 */
int stocks_greedy(int prices[], int numPrices){
  int bestBuy = INT_MAX;
  int bestSell = -1;
  int bestProfit = 0;

  for(int i=0; i<numPrices; i++){
    if(prices[i] < bestBuy){
      bestBuy = prices[i];
      continue;
    }
    if(prices[i] > bestSell && prices[i] > bestBuy){
      bestSell = prices[i];
      bestProfit = bestSell - bestBuy;
      continue;
    }
  }

  return bestProfit;
}