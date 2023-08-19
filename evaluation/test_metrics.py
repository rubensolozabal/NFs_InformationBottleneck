import torch
import numpy as np

def test_metrics(inn, data, args):
    metrics = {'accuracy':     [],
               'bits_per_dim': [],
               'L_x':          [],
               'L_y':          [],
               'recall@1':      [],
               'recall@2':      [],
               'recall@5':      [],
               'precision@1':   [],
               'precision@2':   [],
               'precision@5':   [],
               'auroc':         [],}


    with torch.no_grad():
        for x, y in data.test_loader:
            x, y = x.cuda(), data.onehot(y.cuda())
            output = inn.validate(x, y)

            metrics['L_x'].append(output['L_x_val'].item())
            metrics['L_y'].append(output['L_y_val'].item())

            bpd = output['L_x_val'].item()
            if eval(args['data']['dequantize_uniform']):
                bpd += np.log(256)
            else:
                bpd += np.log(data.sigma) + 0.5 * np.log(2 * np.pi)
            bpd -= 0.5 * np.log(2*np.pi)
            bpd /= np.log(2)

            metrics['bits_per_dim'].append(bpd)
            metrics['accuracy'].append(100. * output['acc_val'].item())

            metrics['recall@1'].append(output['recall@1'].item())
            metrics['recall@2'].append(output['recall@2'].item())
            metrics['recall@5'].append(output['recall@5'].item())
            metrics['precision@1'].append(output['precision@1'].item())
            metrics['precision@2'].append(output['precision@2'].item())
            metrics['precision@5'].append(output['precision@5'].item())
            metrics['auroc'].append(output['auroc'].item())



    for k in metrics:
        # has to be cast from np.float32 to float() explicitly,
        # otherwise json will not accept it.
        metrics[k] = float(np.mean(metrics[k]))

    return metrics

