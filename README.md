

# Ray Casting Object Manipulation in Godot

This project demonstrates the use of the ray-casting technique to grab and manipulate objects within the Godot game engine. Ray-casting is a grabbing technique where a light ray extends from the user's hand. By intersecting an object with this ray and releasing the button, the object is attached to the ray. Users can then manipulate the object using wrist or arm motion.

## Features

- **Ray-Casting Technique**: Allows users to grab objects by intersecting them with a ray extending from the user's hand.
- **Object Manipulation**: Objects can be moved around easily using wrist or arm motions once they are attached to the ray.
- **Fishing Reel Metaphor**: Enhanced ray-casting with a "fishing reel" metaphor to allow translation towards and away from the user, adding an additional degree of freedom.

## How It Works

1. **Grabbing Objects**: 
    - A light ray extends from the user's hand.
    - Intersect an object with this ray and release the button to attach the object to the ray.
    - The object is now attached to the end of the ray and can be manipulated.

2. **Manipulating Objects**:
    - Move the object using wrist or arm motions.
    - Rotate the object around the axis of the ray.
    - Use the "fishing reel" metaphor to move the object closer or farther away using two mouse buttons, adding control over the distance between the user and the object.

## Drawbacks and Solutions

### Drawbacks of Basic Ray-Casting
- **Lever-Arm Problem**: Objects are attached to the end of the ray, making it difficult to rotate them in place except around the ray's axis.
- **Limited Degrees of Freedom**: Only one degree of freedom (rotation around the ray axis) can be independently controlled. Other movements are dependent on this.

### Enhanced with Fishing Reel Metaphor
- **Additional Degree of Freedom**: The fishing reel metaphor allows users to control the object's distance from the user, adding an additional independent degree of freedom.
- **Improved Control**: Users can reel objects closer or farther away using two mouse buttons, allowing for more precise manipulation.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/ray-casting-godot.git
    ```
2. Open the project in Godot:
    - Launch Godot and navigate to the cloned repository folder.
    - Open the project.godot file.

## Usage

1. Run the project in Godot.
2. Use the designated controls to extend a ray from the user's hand.
3. Intersect objects with the ray to grab them.
4. Manipulate the objects using wrist or arm motions.
5. Use the fishing reel metaphor to adjust the distance of the object from the user.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any bugs or feature requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
