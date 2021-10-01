import tensorflow as tf
from tensorflow.keras import backend as K
from tensorflow.keras.layers import Layer
import tensorflow.keras.activations
import tensorflow.keras.layers as layers

class ResidualBlock1(tf.keras.layers.Layer):
    '''
    Define a residual block with pre-activations with batch normalization.

    :param filters:
    :param kernel_size:
    :return: list of layers.py added
    '''

    def __init__(self, filters, kernel_size, name="res_block1"):
        super(ResidualBlock1, self).__init__()
        self.cname=name
        layers = []

        layers.append(tf.keras.layers.BatchNormalization())
        print("--- batch normalization")

        layers.append(tf.keras.layers.Activation('elu'))
        print("--- elu")

        layers.append(tf.keras.layers.Conv1D(filters, kernel_size, activation=None, padding='same'))
        print("--- conv1d  filters: {0} kernel_size: {1}".format(filters, kernel_size))


        layers.append(tf.keras.layers.BatchNormalization())
        print("--- batch normalization")

        layers.append(tf.keras.layers.Activation('elu'))
        print("--- elu")

        layers.append(tf.keras.layers.Conv1D(filters, kernel_size, activation=None, padding='same'))
        print("--- conv1d  filters: {0} kernel_size: {1}".format(filters, kernel_size))

        self.layers = layers


    def call(self, input_data):
        '''
        Call a residual block.

        :param residual_block: list of layers.py in the block
        :return: output tensor

        '''

        # print("--- adding {0} ".format(type(self.layers[0])))
        x = self.layers[0](input_data)

        for layer in self.layers[1:]:
            # print("--- adding {0} ".format(type(layer)))
            x = layer(x)


        # print("--- performing addition ")
        x = tf.keras.layers.Add()([x, input_data])


        return x



class ResidualBlock2(tf.keras.layers.Layer):
    '''
    Define a residual block with conv act bn.


    :param filters:
    :param kernel_size:
    :return: list of layers.py added
    '''

    def __init__(self, filters, kernel_size, name="res_block1"):
        super(ResidualBlock2, self).__init__()
        self.cname=name
        layers = []

        layers.append(tf.keras.layers.Conv1D(filters, kernel_size, activation="elu", padding='same'))
        print("--- conv1d  filters: {0} kernel_size: {1}".format(filters, kernel_size))

        layers.append(tf.keras.layers.BatchNormalization())
        print("--- batch normalization")


        layers.append(tf.keras.layers.Conv1D(filters, kernel_size, activation="elu", padding='same'))
        print("--- conv1d  filters: {0} kernel_size: {1}".format(filters, kernel_size))

        layers.append(tf.keras.layers.BatchNormalization())
        print("--- batch normalization")

        self.layers = layers


    def call(self, input_data):
        '''
        Call a residual block.

        :param residual_block: list of layers.py in the block
        :return: output tensor

        '''

        # print("--- adding {0} ".format(type(self.layers[0])))
        x = self.layers[0](input_data)

        for layer in self.layers[1:]:
            # print("--- adding {0} ".format(type(layer)))
            x = layer(x)


        # print("--- performing addition ")
        x = tf.keras.layers.Add()([x, input_data])


        return x

class ResidualBlock3(tf.keras.layers.Layer):
    '''
    Define a residual block with conv act bn.


    :param filters:
    :param kernel_size:
    :return: list of layers.py added
    '''

    def __init__(self, filters, kernel_size, name="res_block1"):
        super(ResidualBlock3, self).__init__()
        self.cname=name
        layers = []

        layers.append(tf.keras.layers.Conv1D(filters, kernel_size, padding='same'))
        layers.append(tf.keras.layers.LeakyReLU())
        print("--- conv1d  filters: {0} kernel_size: {1}".format(filters, kernel_size))

        layers.append(tf.keras.layers.BatchNormalization())
        print("--- batch normalization")


        layers.append(tf.keras.layers.Conv1D(filters, kernel_size, padding='same'))
        layers.append(tf.keras.layers.LeakyReLU())
        print("--- conv1d  filters: {0} kernel_size: {1}".format(filters, kernel_size))

        layers.append(tf.keras.layers.BatchNormalization())
        print("--- batch normalization")

        self.layers = layers


    def call(self, input_data):
        '''
        Call a residual block.

        :param residual_block: list of layers.py in the block
        :return: output tensor

        '''

        # print("--- adding {0} ".format(type(self.layers[0])))
        x = self.layers[0](input_data)

        for layer in self.layers[1:]:
            # print("--- adding {0} ".format(type(layer)))
            x = layer(x)


        # print("--- performing addition ")
        x = tf.keras.layers.Add()([x, input_data])


        return x

class ResidualBlock4(tf.keras.layers.Layer):
    '''
    Define a residual block with conv act bn.


    :param filters:
    :param kernel_size:
    :return: list of layers.py added
    '''

    def __init__(self, filters, kernel_size, name="res_block1"):
        super(ResidualBlock4, self).__init__()
        self.cname=name
        layers = []

        layers.append(tf.keras.layers.Conv1D(filters, kernel_size, padding='same'))
        layers.append(tf.keras.layers.LeakyReLU())
        print("--- conv1d  filters: {0} kernel_size: {1}".format(filters, kernel_size))


        layers.append(tf.keras.layers.Conv1D(filters, kernel_size, padding='same'))
        layers.append(tf.keras.layers.LeakyReLU())
        print("--- conv1d  filters: {0} kernel_size: {1}".format(filters, kernel_size))

        self.layers = layers


    def call(self, input_data):
        '''
        Call a residual block.

        :param residual_block: list of layers.py in the block
        :return: output tensor

        '''

        # print("--- adding {0} ".format(type(self.layers[0])))
        x = self.layers[0](input_data)

        for layer in self.layers[1:]:
            # print("--- adding {0} ".format(type(layer)))
            x = layer(x)


        # print("--- performing addition ")
        x = tf.keras.layers.Add()([x, input_data])


        return x


class BiasWeightLayerPrime(Layer):

    def __init__(self, **kwargs):
        super(BiasWeightLayerPrime, self).__init__(**kwargs)
        self.primes = []
        for i in range(2, 1000):
            ok = True
            for j in self.primes:
                if i % j == 0:
                    ok = False
                    break
            if ok:
                self.primes.append(i)
        #self.primes = [3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127]
        self.flatten = layers.Flatten()

    def build(self, input_shape):
        # Create a trainable weight variable for this layer.
        shape=(1,) + input_shape[1:]
        weightshape = (len(self.primes), 1000)
        self.kernel = self.add_weight(name='kernel', 
                                      shape=weightshape,
                                      initializer='ones',
                                      trainable=True)
        self.bias = self.add_weight(name='bias', 
                                      shape=weightshape,
                                      initializer='zeros',
                                      trainable=True)
        self.flatten.build(shape)
        super(BiasWeightLayerPrime, self).build(input_shape)  # Be sure to call this at the end

    def createweight(self, x, weights):
        flatx = self.flatten(x)
        #fullrange = tf.range(0, tf.shape(flatx)[1])
        #result = tf.zeros(flatx.shape)
        #for i, prime in enumerate(self.primes):
        #result = tf.reduce_sum(tf.map_fn(lambda vals : tf.gather(weights[vals[0], :], fullrange % vals[1]), tf.convert_to_tensor(list(enumerate(self.primes))), dtype=tf.float32), axis=0)
        result = tf.reduce_sum(tf.map_fn(lambda vals : tf.tile(weights[vals[0], 0:vals[1]], tf.truncatediv(tf.shape(flatx)[1:2] + vals[1] - 1, vals[1]))[0:tf.shape(flatx)[1]], tf.convert_to_tensor(list(enumerate(self.primes))), dtype=tf.float32), axis=0)
            #for j in range(24):
            #    result += tf.where(tf.expand_dims(tf.stop_gradient(tf.map_fn(lambda t : tf.bitwise.bitwise_and(t * prime, 1 << j), fullrange)) > 0, axis=0), weights[i, j], 0.)
        return tf.expand_dims(tf.reshape(result, tf.shape(x)[1:]), axis=0)

    def call(self, x):
        #self.add_loss(tf.math.reduce_sum(1e-5 - tf.math.minimum(tf.square(self.kernel), 1e-5)))
        return x * self.createweight(x, self.kernel) + self.createweight(x, self.bias)

    def compute_output_shape(self, input_shape):
        return input_shape

class BiasWeightLayer(Layer):

    def __init__(self, **kwargs):
        super(BiasWeightLayer, self).__init__(**kwargs)

    def build(self, input_shape):
        # Create a trainable weight variable for this layer.
        shape=(1,) + input_shape[1:]
        self.kernel = self.add_weight(name='kernel', 
                                      shape=shape,
                                      initializer='uniform',
                                      trainable=True)
        self.bias = self.add_weight(name='bias', 
                                      shape=shape,
                                      initializer='uniform',
                                      trainable=True)
        super(BiasWeightLayer, self).build(input_shape)  # Be sure to call this at the end

    def call(self, x):
        self.add_loss(tf.math.reduce_sum(1e-5 - tf.math.minimum(tf.square(self.kernel), 1e-5)))
        return x * self.kernel + self.bias

    def compute_output_shape(self, input_shape):
        return input_shape


class AttentionPoolLayer(Layer):

    def __init__(self, **kwargs):
        super(AttentionPoolLayer, self).__init__()
        self.conv1 = layers.Conv1D(**kwargs)        
        poolargs = kwargs.copy()
        del poolargs["kernel_size"]
        del poolargs["filters"]
        poolargs["pool_size"] = kwargs["kernel_size"]
        self.avepool = layers.AveragePooling1D(**poolargs)

    def build(self, input_shape):
        # Create a trainable weight variable for this layer.
        shape=self.compute_output_shape(input_shape)
        self.conv1.build(shape)
        self.avepool.build(shape)
        self._trainable_weights += self.conv1._trainable_weights
        self._trainable_weights += self.avepool._trainable_weights
        super(AttentionPoolLayer, self).build(input_shape)  # Be sure to call this at the end

    def call(self, x):
        weight = tf.math.abs(x[:,:,1::2])
        return self.conv1(x[:,:,::2] * weight) / self.avepool(weight)

    def compute_output_shape(self, input_shape):
        return input_shape[0:-1] + (input_shape[-1] // 2,)

class AttentionEluPoolLayer(Layer):
    """Not ELU, really, softplus..."""
    def __init__(self, bias=0., **kwargs):
        super(AttentionEluPoolLayer, self).__init__()
        self.conv1 = layers.Conv1D(**kwargs)
        self.bias = bias
        poolargs = kwargs.copy()
        del poolargs["kernel_size"]
        del poolargs["filters"]
        poolargs["pool_size"] = kwargs["kernel_size"]
        self.avepool = layers.AveragePooling1D(**poolargs)

    def build(self, input_shape):
        # Create a trainable weight variable for this layer.
        shape=self.compute_output_shape(input_shape)
        self.conv1.build(shape)
        self.avepool.build(shape)
        self._trainable_weights += self.conv1._trainable_weights
        self._trainable_weights += self.avepool._trainable_weights
        super(AttentionEluPoolLayer, self).build(input_shape)  # Be sure to call this at the end

    def call(self, x):
        weight = tf.keras.activations.softplus(x[:,:,1::2]) + self.bias
        return self.conv1(x[:,:,::2] * weight) / (self.avepool(weight))

    def compute_output_shape(self, input_shape):
        return input_shape[0:-1] + (input_shape[-1] // 2,)
