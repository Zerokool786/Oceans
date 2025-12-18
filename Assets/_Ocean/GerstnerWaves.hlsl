void CalculateGerstnerWave_float(
    float3 position,
    float steepness,
    float wavelength,
    float speed,
    float2 direction,
    float time,
    out float3 offset,
    out float3 normal
)
{
    direction = normalize(direction);
    float k = 2 * 3.14159 / wavelength;
    float c = sqrt(9.8 / k);
    float f = k * (dot(direction, position.xz) - c * speed * time);
    float a = steepness / k;

    // Calculate displacement
    offset.x = direction.x * (a * cos(f));
    offset.y = a * sin(f);
    offset.z = direction.y * (a * cos(f));

    // Calculate normal
    normal.x = -direction.x * (k * a * sin(f));
    normal.y = 1 - (k * a * cos(f));
    normal.z = -direction.y * (k * a * sin(f));
}