from wdict import Wdict

filename = 'cooked.dict'
f = open(filename)

word_dict = Wdict(f)

__all__ = ["word_dict']
