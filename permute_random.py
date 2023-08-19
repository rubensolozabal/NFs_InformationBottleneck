import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F


class PermuteRandom(nn.Module):
    '''permutes input vector in a random but fixed way'''

    def __init__(self, dims_in, seed):
        super().__init__()

        self.in_channels = dims_in[0][0]

        np.random.seed(seed)
        self.perm = np.random.permutation(self.in_channels)
        np.random.seed()

        self.perm_inv = np.zeros_like(self.perm)
        for i, p in enumerate(self.perm):
            self.perm_inv[p] = i

        self.perm = torch.LongTensor(self.perm)
        self.perm_inv = torch.LongTensor(self.perm_inv)

    def forward(self, x, rev=False):
        if not rev:
            return [x[0][:, self.perm]]
        else:
            return [x[0][:, self.perm_inv]]

    def jacobian(self, x, rev=False):
        # TODO: use batch size, set as nn.Parameter so cuda() works
        return 0.

    def jacobian_diag(self, x, rev=False):
        return torch.ones_like(x[0]).flatten(1)

    def output_dims(self, input_dims):
        assert len(input_dims) == 1, "Can only use 1 input"
        return input_dims