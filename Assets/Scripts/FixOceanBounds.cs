using UnityEngine;

public class FixOceanBounds : MonoBehaviour
{
    void Start()
    {
        // This tricks Unity into thinking the ocean is 1000 meters tall
        // so it never stops drawing it, even when waves go high.
        Mesh mesh = GetComponent<MeshFilter>().mesh;
        mesh.bounds = new Bounds(Vector3.zero, new Vector3(1000, 1000, 1000));
    }
}
