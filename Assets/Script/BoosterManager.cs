using DG.Tweening.Core.Easing;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class BoosterManager : MonoBehaviour
{
    public ParticleSystem ParticalGlass;
    public Transform[] Panels;
    public LayerMask ignoreLayers;
    private GameObject BrokenGlass;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    public void Update()
    {
        // Hammer
        if (GameManager.instance.HammerBooster == true)
        {
            GameManager.instance.OnHammerBooster();
            for (int i = 0; i < Panels.Length; i++)
            {
                if (Input.GetMouseButtonDown(0))
                {
                    Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
                    RaycastHit2D hit = Physics2D.Raycast(ray.origin, ray.direction, Mathf.Infinity, ~ignoreLayers);
                    if (hit.collider != null)
                    {
                        if (hit.collider.gameObject == Panels[i].gameObject)
                        {
                            Transform BrokenChild = Panels[i].Find("BrokenGlass");
                            if (BrokenChild != null)
                            {
                                BrokenChild.gameObject.SetActive(true);
                            }
                            //Panels[i].gameObject.SetActive(false);
                            //BrokenGlass = Panels[i].game
                            //BrokenGlass.SetActive(true);
                            GameManager.instance.HammerBDown();
                            GameManager.instance.HammerBooster = false;
                            GameManager.instance.OffHammerBooster();
                            StartCoroutine(BreakGlass(i));
                        }
                    }
                }
            }
        }
    }
    IEnumerator BreakGlass(int i)
    {
        ParticalGlass = Panels[i].GetComponent<ParticleSystem>();
        //yield return new WaitForSeconds(1f);
        ParticalGlass.Play();
        yield return new WaitForSeconds(0.5f);
        Panels[i].gameObject.SetActive(false);
    }
}
