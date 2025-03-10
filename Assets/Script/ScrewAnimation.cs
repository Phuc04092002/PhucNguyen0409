using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using Unity.Burst.CompilerServices;

public class ScrewAnimation : MonoBehaviour
{
    public LayerMask ignoreLayers;
    private Animator animator;
    private bool A;
    // Start is called before the first frame update

    // Update is called once per frame
     void Start()
    {
        animator = transform.parent.GetComponent<Animator>();
    }
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit2D hit = Physics2D.Raycast(ray.origin, ray.direction, Mathf.Infinity, ~ignoreLayers);
            if (hit.collider != null)
            {
                if (hit.collider.gameObject == gameObject)
                {
                    animator.SetBool("Click", true);
                }
            }
        }
        //if (A)
        //{
        //    animator.Play("ScrewReRotate",1,0f);
        //    A = false;
        //}
    }
}
