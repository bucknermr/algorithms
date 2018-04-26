def highest_product_of_3(int_list):
    sorted_list = sorted(int_list)
    a = sorted_list[0] * sorted_list[1] * sorted_list[-1]
    b = sorted_list[-1] * sorted_list[-2] * sorted_list[-3]
    return a if a > b else b


print(highest_product_of_3([3, 4, 2, 6, 100, 0, 1]) == 2400)
print(highest_product_of_3([-10, -5, 3, 4, 2, 1, 8]) == 400)
print(highest_product_of_3([-299, -4, -1, -12, -3, -5]) == -12)
print(highest_product_of_3([-299, -4, -1, -12, -3, -5, 0]) == 0)
