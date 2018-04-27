def highest_product_of_3(int_list):
    if len(int_list) < 3:
        raise "Need at least 3 integers"

    highest = max(int_list[:2])
    lowest = min(int_list[:2])
    highest_product_of_2 = highest * lowest
    lowest_product_of_2 = highest_product_of_2
    current_answer = float('-inf')

    for int in int_list[2:]:
        current_answer = max(
            current_answer,
            highest_product_of_2 * int,
            lowest_product_of_2 * int)

        highest_product_of_2 = max(
            highest_product_of_2,
            highest * int,
            lowest * int)

        lowest_product_of_2 = min(
            lowest_product_of_2,
            highest * int,
            lowest * int)

        highest = max(highest, int)
        lowest = min(lowest, int)

    return current_answer





print(highest_product_of_3([3, 4, 2, 6, 100, 0, 1]) == 2400)
print(highest_product_of_3([-10, -5, 3, 4, 2, 1, 8]) == 400)
print(highest_product_of_3([-299, -4, -1, -12, -3, -5]) == -12)
print(highest_product_of_3([-299, -4, -1, -12, -3, -5, 0]) == 0)
