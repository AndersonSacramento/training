from tensorflow import keras
import tensorflow as tf


class SimpleDense(keras.layers.Layer):

    def __init__(self, units, activation=None):
        super().__init__()
        self.units = units
        self.activation = activation

    # state creation
    def build(self, input_shape):
        # shape inference
        input_dim =  input_shape[-1]
        # shortcut for creating weights.
        self.W = self.add_weight(shape=(input_dim, self.units),
                                 initializer="random_normal")
        self.b = self.add_weight(shape=(self.units,),
                                 initializer="zeros")

    # the forward pass
    def call(self, inputs):
        y = tf.matmul(inputs, self.W) +  self.b
        if self.activation is not None:
            y = self.activation(y)
        return y



if __name__ == '__main__':
    my_dense = SimpleDense(units=32, activation=tf.nn.relu)
    input_tensor = tf.ones(shape=(2, 784))
    output_tensor = my_dense(input_tensor)
    print(output_tensor)
        
