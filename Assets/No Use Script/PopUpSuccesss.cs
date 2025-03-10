using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PopUpSuccesss : MonoBehaviour
{
    public Canvas canvasToActivate;

    public void ActivateCanvas()
    {
        canvasToActivate.enabled = true;
    }

    public void DeactivateCanvas()
    {
        canvasToActivate.enabled = false;
    }
}