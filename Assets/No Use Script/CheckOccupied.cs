using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckOccupied : MonoBehaviour
{
    private bool targetOccupied = false;
    // Start is called before the first frame update
    public void Occupied()
    {
        targetOccupied = true;
    }
}
