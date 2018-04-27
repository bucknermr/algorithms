class BinaryHeap:
    def __init__(self, comp = None):
        self.comp = comp or self.default_compare
        self.store = []

    def peek(self):
        return self.store[0]

    def add(self, el):
        self.store.append(el)
        return self.heapify_up(len(self.store) - 1, self.store, self.comp)

    def extract(self):
        top = self.store[0]
        self.store[0] = self.store[-1]
        self.store.pop()
        self.heapify_down(0, self.store, self.comp)
        return top

    @classmethod
    def heapify_down(cls, idx, store, comp = None):
        comp = comp or cls.default_compare
        children_indices = cls.children_indices(idx, store)
        if (len(children_indices) == 0):
            return store

        children = [store[i] for i in children_indices]
        current_el = store[idx]

        if (any(comp(current_el, child) > 0 for child in children)):

            swap_idx = (
                children_indices[1] if (len(children) > 1 and
                comp(children[0], children[1]) > 0)
                else children_indices[0])

            store[idx], store[swap_idx] = store[swap_idx], store[idx]
            return cls.heapify_down(swap_idx, store, comp)

        return store

    @classmethod
    def heapify_up(cls, idx, store, comp = None):
        comp = comp or cls.default_compare

        parent_index = cls.parent_index(idx)
        if parent_index is None:
            return store

        parent = store[parent_index]
        current_el = store[idx]

        if comp(parent, current_el) > 0:
            store[parent_index], store[idx] = current_el, parent
            return cls.heapify_up(parent_index, store, comp)

        return store

    @staticmethod
    def parent_index(idx):
        if idx == 0:
            return None
        return (idx - 1) // 2

    @staticmethod
    def children_indices(idx, store):
        return [i for i in [(idx * 2) + 1, (idx * 2) + 2] if i < len(store)]

    @staticmethod
    def default_compare(x, y):
        return x - y

class MaxHeap(BinaryHeap):
    def __init__(self):
        BinaryHeap.__init__(self, lambda x, y: y - x)

class MinHeap(BinaryHeap):
    pass
